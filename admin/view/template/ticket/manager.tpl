<?php echo $header; ?>
<div id="content">
    <form class='form form-inline' action="./index.php?route=ticket/manager" method="POST" id='search-form' style="margin: 2em;">
        <div class="form-group">
            <label for="search">Search</label>
            <input type="text" id="search" name="search" class="form-control">
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <select type="text" id="location" name="location" class="form-control">
                <?php foreach ($locations as $location) { ?>
                <option value='<?php echo $location; ?>'><?php echo $location ?></option>
                <?php } ?>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-warning btn-sm" value="Submit">
        </div>
    </form>
    
    <table class="table table-bordered" id="ticket-content">
        <thead>
            <tr>
                <th>Order Number</th>
                <th>User</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>VVIP</th>
                <th>VIP</th>
                <th>Couple</th>
                <th>A Res</th>
                <th>B Res</th>
                <th>C Res</th>
                <th>Total</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($orders as $order) { ?>
            <tr id="<?php echo $order['id']; ?>" class="ticket-row" style="height: 60px;">
            <td><?php echo $order['number']; ?></td>
            <td><?php echo $order['username']; ?></td>
            <td><?php echo $order['name']; ?></td>
            <td><?php echo $order['email']; ?></td>
            <td><?php echo $order['phone']; ?></td>
            <td><?php echo $order['VVIP']; ?></td>
            <td><?php echo $order['VIP']; ?></td>
            <td><?php echo $order['Couple']; ?></td>
            <td><?php echo $order['A']; ?></td>
            <td><?php echo $order['B']; ?></td>
            <td><?php echo $order['C']; ?></td>
            <td><?php echo $order['total']; ?></td>
            <td class="action">
                <span><i class="fa fa-spinner fa-spin" style="display: none; font-size: 1.8em;"></i></span>
                <button class='btn btn-primary btn-sm'>Pick</button>
            </td>
            </tr>
            <?php } ?>
        </tbody>
    </table>
</div>
<script type='text/javascript'>
    ;(function($){
        var $tickets = $("#ticket-content").find(".ticket-row");
        
        $tickets.each(function(){
            var _$this      =   $(this),
                _$loading   =   _$this.find('i'),
                _$button    =   _$this.find('button'),
                _id    = $(this).attr('id');
            
            _$button.click(function(){

                if(confirm('Please confirm?')) {
                    $.ajax({
                        url: './index.php?route=ticket/manager/setOrderPicked',
                        data: {id: _id},
                        method: 'POST',
                        datatype: 'json',
                        beforeSend: function(){
                            _$button.hide();
                            _$loading.show();
                        },
                        
                        success: function(){
                            _$loading.hide();
                            _$button.show();
                            _$button.removeClass('btn-primary');
                            _$button.addClass('btn-disabled');
                            _$button.attr('disabled', true);
                            _$button.html('Picked');
                        }
                    });
                }
            
            });
        });
        
        
    })(jQuery);
</script>