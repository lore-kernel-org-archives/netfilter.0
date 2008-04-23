From: "Gilad Benjamini" <gilad.benjamini@gmail.com>
Subject: Reject with tcp-reset on a bridge
Date: Wed, 23 Apr 2008 11:31:14 -0700
Message-ID: <d95317090804231131j66d2f84fp20a548c7d0f4d0a3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=7lHLoYXOqQmYzFzf/5rechiyWwiNKETJBb+5odkcHGI=;
        b=K/fC8mhsbNrbLg2oVGgcAetHaOFR6VNPJ9zWeWb7eDBFYY/FT5d6gcC+3Yx/Z87VBvBZsdUptoKjgABg6q7XwRNR7PgR1fwMe/L8OU4F+8FqZlbx2TRVDBTjKNcGrQYm+3pGinBZCWfXW+C/sz0Fn7oMGYaswmVeB5uYAyFt+fs=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am using iptables to firewall connections on a bridge.

The rule below (minimized to the sake of the example) works
       iptables -A FORWARD -p tcp -j REJECT

A TCP-reset variation doesn't work
      iptables -A FORWARD -p tcp -j REJECT  --reject-with tcp-reset

The TCP packets don't go through, but I don't see a RST, or any other
packet, coming back.
My options are:
   a. Something is wrong in my configuration
   b. This isn't suppose to work
   c. This doesn't work because of a bug
   d. None of the above

Which is it ?
