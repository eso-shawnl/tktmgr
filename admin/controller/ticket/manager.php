<?php
class ControllerTicketManager extends Controller {
	private $error = array();

	public function index() {
            //We don't have language for this currently
		//$this->load->language('ticket/manager');

                // Load Steven's model interface
                $this->load->model('models/interface');
                
                //We can define location based on user group id like this:
                $user_group_id = $this->user->user_group_id;
                $group_location_mapping = array(
                    '1' => 'location_1',
                    '2' => 'location_2',
                    '3' => 'location_3'
                );
                $current_location = $group_location_mapping[$user_group_id];
                
                $data['current_location'] = $current_location;
                
                // Check if there is specific location in post
                $location = isset($this->request->post['location']) ? $this->request->post['location'] : $current_location;
                
                //Otherwise we need to add user location in database
                //$location = $this->user->location;
                
                // Get orders based on location, need to show all if location === 'ALL'
                $orders = $this->model_models_interface->model_interface(0,'order','by_location','get', $location);
                
                // Check if search argument in post
                if(isset($this->request->post['post'])) {
                    $search = $this->request->post['post'];
                    //search database based on search argument, don't forget include location constraint
                    $orders = $this->model_models_interface->model_interface(0,'order','search', 'get', $search);
                }
                
                $data['orders'] = $orders;
                
                $data['header'] = $this->load->controller('common/header');
                
                
                //Following data is for placeholder
                $data['orders'] = array(
                    array(
                        'id'        =>  '21042',
                        'number'    =>  '100001',
                        'username'  =>  'peter001',
                        'name'      =>  'Peter Chrystall',
                        'email'     =>  'peter@test.com',
                        'phone'     =>  '10001',
                        'VVIP'      =>  '2',
                        'VIP'       =>  '1',
                        'Couple'    =>  '0',
                        'A'         =>  '1',
                        'B'         =>  '3',
                        'C'         =>  '4',
                        'total'         =>  '1200.00'
                    ),
                    array(
                        'id'        =>  '14332',
                        'number'    =>  '100003',
                        'username'  =>  'helen001',
                        'name'      =>  'Helen Swift',
                        'email'     =>  'helen@test.com',
                        'phone'     =>  '10003',
                        'VVIP'      =>  '1',
                        'VIP'       =>  '0',
                        'Couple'    =>  '1',
                        'A'         =>  '2',
                        'B'         =>  '5',
                        'C'         =>  '1',
                        'total'         =>  '2300.00'
                    ),
                    array(
                        'id'        =>  '21047',
                        'number'    =>  '100007',
                        'username'  =>  'peter001',
                        'name'      =>  'Peter Chrystall',
                        'email'     =>  'peter@test.com',
                        'phone'     =>  '10001',
                        'VVIP'      =>  '2',
                        'VIP'       =>  '1',
                        'Couple'    =>  '0',
                        'A'         =>  '1',
                        'B'         =>  '3',
                        'C'         =>  '4',
                        'total'         =>  '620.00'
                    ),
                    array(
                        'id'        =>  '14338',
                        'number'    =>  '100008',
                        'username'  =>  'helen001',
                        'name'      =>  'Helen Swift',
                        'email'     =>  'helen@test.com',
                        'phone'     =>  '10003',
                        'VVIP'      =>  '1',
                        'VIP'       =>  '0',
                        'Couple'    =>  '1',
                        'A'         =>  '2',
                        'B'         =>  '5',
                        'C'         =>  '1',
                        'total'         =>  '3300.00'
                    )
                );
                
                $data['locations'] = array(
                    '1' =>  'Suite 4, level 1, 135 Parnell Road, Parnell (Captain E&M Office)',
                    '2' =>  'Unit 2, level 6, 220 Queen Street, Auckland City',
                    '3' =>  '6D, level 6, 300 Queen Street, Auckland City'
                );
                
                // Render with manager template
		$this->response->setOutput($this->load->view('ticket/manager.tpl', $data));
	}
        
        public function setOrderPicked() {
            sleep(2000);
            if(isset($this->request->post['id'])){
                $id = isset($this->request->post['id']);
                $this->load->model('models/interface');
                
                // Here we edit the order as picked
            //  $this->model_models_interface->model_interface('0', 'order','interface', 'edit', $id);
                
                $json = array(
                    'success'   =>  true
                );

                echo json_encode($json);
                
            } else {
                // Need to give error if no id received
                echo 'Error here';
            }
            
        }
}