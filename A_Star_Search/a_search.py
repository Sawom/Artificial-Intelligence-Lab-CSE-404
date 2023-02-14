def a_star_search(start, goal):
    open_fringe = set(start)
    close_fringe = set()
    g = {}  # here I store distance from starting node
    parents = {}  # here parents contains an adjacency map of all nodes

    # starting node from 1st node is zero
    g[start] = 0

    parents[start] = start  # start node

    while len(open_fringe) > 0:
        n = None

        for v in open_fringe:
            if n == None or g[v] + heuristic(v) < g[n] + heuristic(n):
                n = v

        if n == goal or Graph_nodes[n] == None:
            pass
        else:
            for (m, weight) in get_neighbors(n):
                if m not in open_fringe and m not in close_fringe:
                    open_fringe.add(m)
                    parents[m] = n
                    g[m] = g[n] + weight

                else:
                    if g[m] > g[n] + weight:
                        # update g(m)
                        g[m] = g[n] + weight
                        # change parent of m to n
                        parents[m] = n
                        # if m in closed set,remove and add to open
                        if m in close_fringe:
                            close_fringe.remove(m)
                            open_fringe.add(m)

        if n == None:
            print('Path does not exist!')
            return None

        if n == goal:
            path = []
            path_cp = []
            full = {
                'H': "Mugdapara (Home)",
                'KBS': "Komolapur Bus Stand",
                'Bod': "Boddhomondir",
                'Bas': "Basabo",
                'K': "Khilgaw",
                'Mal': 'Malibag',
                'Mog': 'Mogbazar',
                'Ban': "Banglamotor",
                'P': 'Panthopath',
                'Farm': 'Farmget',
                'TT': 'TT para',
                'KRS': "Komolapur Railway station",
                'U': "UAP"
            }
            while parents[n] != n:
                path.append(n)
                path_cp.append(full[n])
                n = parents[n]

            path.append(start)
            path_cp.append(full[start])
            path.reverse()
            path_cp.reverse()
            print('Path found: {}'.format(str(path_cp).replace(",", "-->")))
            return path

        open_fringe.remove(n)
        close_fringe.add(n)

    print('Path does not exist!')
    return None

def get_neighbors(v):
    if v in Graph_nodes:
        return Graph_nodes[v]
    else:
        return None

def heuristic(n):
    H_dist = {
        'H': 3,
        'KBS': 1,
        'Bod': 1,
        'Bas': 2,
        'K': 2,
        'Mal': 2,
        'Mog': 1,
        'Ban': 4,
        'P': 3,
        'Farm': 2,
        'TT': 1,
        'KRS': 2,
        'U': 0
    }
    return H_dist[n]

Graph_nodes = {
    'H': [('KBS', 0.8), ('TT', 0.9)],
    'KBS': [('Bod', 0.7)],
    'Bod': [('Bas', 1.4)],
    'Bas': [('K', 1)],
    'K': [('Mal', 1.5)],
    'Mal': [('Mog', 0.9)],
    'Mog': [('Ban', 3.5)],
    'Ban': [('P', 2.4)],
    'P': [('Farm', 1.6)],
    'Farm': [('U', 0.4)],
    'TT': [('KRS', 1.3)],
    'KRS': [('Mal', 1.8)],
    'PP': [('U', 0.5)],
    'U': None
}

path = a_star_search('H', 'U')
path_cost = 0.0

for i in range(len(path) - 1):
    for key, value in Graph_nodes[path[i]]:
        if key == path[i + 1]:
            path_cost += value
            break
print("The path cost is %.2f Km" % path_cost)