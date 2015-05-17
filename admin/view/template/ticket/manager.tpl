<?php echo $header; ?>
<div id="content">
    
    <table class="table table-striped">
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
            <tr id="<?php echo $order['id']; ?>">
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
            <td><button class='btn btn-primary'>Collect</button></td>
            </tr>
            <?php } ?>
        </tbody>
    </table>

</div>