<?php if (session()->get('pesan')) : ?>

    <div class="callout callout-info" id="notifikasi_pesan">
        <?= session()->get('pesan') ?>
    </div>

    <script>
        setTimeout(function() {
            $('#notifikasi_pesan').hide()
        }, 3500)
    </script>
<?php endif; ?>