From: Ivan Petrushev <ivanatora@gmail.com>
Subject: Re: Port forwarding
Date: Wed, 4 Feb 2009 20:38:09 +0200
Message-ID: <d39744a20902041038n501dd455g7864cddd1d2f1870@mail.gmail.com>
References: <5de7cdb50812121533j31484be5pfec1c4a91afae9bb@mail.gmail.com>
	 <5de7cdb50902040948m56b1d58ctf3d9889cbee37465@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=TPIAgsYNE2UmLPm7cMKNuWZIf2RfTiEpbhQx3+06wW4=;
        b=nZ10Y8IZ+igtlAmFUQBclV0dthgtp64wUhwKEaXD20kyEsttPQ0LTeHl7Uf48wbAf1
         yNr+vSd7g6PwIHZEBot0hbJnkLgZkU8SIWG2lSuH1JQlzi0Zd/Nh2LtbRqIcIqDBjZJM
         qN3gjt5MrDyvUqLbMoSm0Lp9+u6K8oOzpmeFs=
In-Reply-To: <5de7cdb50902040948m56b1d58ctf3d9889cbee37465@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: =?ISO-8859-2?B?QrNhv2VqIKZsdXNhcmVr?= <beju@beju.xon.pl>
Cc: netfilter@vger.kernel.org

I think lots of people know how to forward ports.
Default policy doesn't concern you - it is DEFAULT. Once you add rules
that match the desired packets these rules do something and it is not
the default chain action.
Here is example port forwarding:
iptables -t nat -A PREROUTING -p tcp -d 192.168.1.2 --dport 27015 -j
DNAT --to-destination 192.168.0.34
iptables -t nat -A PREROUTING -p udp -d 192.168.1.2 --dport 27015 -j
DNAT --to-destination 192.168.0.34
And if your default FORWARD policy is DROP, then you should change it
to ACCEPT for the matched by the upper rules packets:
iptables -I FORWARD -d 192.168.1.2 -j ACCEPT
