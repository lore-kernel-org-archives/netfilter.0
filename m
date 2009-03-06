From: paulobruck1 <paulobruck1@gmail.com>
Subject: route local packages
Date: Fri, 06 Mar 2009 14:14:41 -0300
Message-ID: <1236359681.3844.26.camel@pauloric.contatogs.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:subject:from:to:content-type
         :date:message-id:mime-version:x-mailer:content-transfer-encoding;
        bh=yQCUmT3A2KeKTu6YpFwHtvQFXxnfglQxmxnEH9UJ03g=;
        b=mTKzDnxx44I4aL9K+nNT1LxeHnycCn3jnXRumSchU3mkinlSs7k7v3prSL3GynuvJI
         TpHjY1h0B+MP7NNWFD6SEFEZBNdzflo2UoQzyDd7snIYlSopdWgPYJkvN9O+HiMWRIwi
         NPOASHUXoAoFa/gC+cBrKLl2W1ayOXICOozjY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Guys

reading
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#NATINTRO

and man iptables  I can't figure out how to route local packages. For
example:

----------LAN ( eth0) -----Firewall/proxy  ------eth1 ( wan1)
					   ------eth2 ( wan2)

Knowing that my route default is wan1, how can I alter some local
packages ( only proxy, for example) to be delivery to eth2????

best regards

