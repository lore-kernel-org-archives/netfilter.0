From: Dan Daugherty <rescue@ddaniscool.com>
Subject: IP Forwarding works on local port but not a remote port
Date: Fri, 5 Feb 2010 10:47:24 -0500
Message-ID: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type;
        bh=4JWpGLGehRCrez4UULeglnrQglAJ0TirGl83acfcCbA=;
        b=Twh0PbTdOsEIYm474fxEoJLqxsLl70nREuA4dGD2NS67LE21N7e082Fg/8KIpUka/X
         V5oyStimbWPvjiKm3d4ykfRGA9mda6bJGX34t2cVwiUeF9bo+JypR+cZZHoPWwGsVwso
         OSu6+9vBywMli3HUpRw/GPa5+CQy4Z2M3NArI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Normally I wouldn't have a problem with this but I'm doing something a
bit different than I would normally do.
I have a RHEL5 server with one NIC that is being used as a router.  My
problem is that I can't seem to completely forward requests off of
this box using iptables.  If I specify a port redirection to a local
port, it works fine but when I specify forwarding that port to another
machine, it fails.  I think the request is being sent through but the
response isn't making it back to me.  I can have a clean iptables to
start and only need to execute one command to make the local forward
work and since I'm not technically using the machine as a gateway, I'm
not sure if all the INPUT, OUTPUT and FORWARD chain commands are
necessary.

10.117.1.205 is the server in question
10.117.1.203 is the server I am trying to forward to

Working command:
iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -j DNAT --to
10.117.1.205:22

Using telnet to test:
telnet 10.117.1.205 1524
Trying 10.117.1.205...
Connected to -----------.
Escape character is '^]'.
SSH-2.0-OpenSSH_4.3

Failing command:
iptables -t nat -A PREROUTING -p tcp --dport 1524 -i eth0 -j DNAT --to
10.117.1.203:1524

Telnet never completes:
telnet 10.117.1.205 1524
Trying 10.117.1.205...


Any help is appreciated.

Thanks,
Dan
