def find_min_info_date(date_info_list):
    min_dict = min(date_info_list, key=lambda x: x['info'])
    return min_dict
