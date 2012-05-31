From: kenxin lau <liuqixing2005@gmail.com>
Subject: A bug of netfilter with IPSEC ?
Date: Thu, 31 May 2012 21:44:28 +0800
Message-ID: <CAGdXrHO_-xUZOt6mafcwGdMtaHQynO_a8QfkS5FufHO38AUvXw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Vx6srocSUW1rVEzMS+K35Mg+qRogztfni8KpmQJgnlY=;
        b=TtjEjd/WQBOICnYVpiDJ+FhF9SZRmtwwHwlElLdKJiJRt7vHWjk0q/KYZ3IclfyVpO
         uhLh7zEZ31x0IVl+Xw2qa03Ff+7oTqjiBKZ/HTnrN6hl3u/ghFy0w2Yk3mOZFU1YFMJV
         fHldyiG9KgXidkzWdvlDXVNVM6H4iJQ5EbCpjx5hOIA2bOQfYAK0pXB9NFz3vw+e6Lz4
         5yNUNnlnXvqDFQ2LE6UJ5QKToLEpUObPqYGcsPNrcpZxvxpHlHc4j/dS678Ukbf/GWBE
         JVEFJDm5LBPFfq6dPT3StixB3JwDtD6BQHj8dDyV5uAfNDLI4dOWOh9IU3kzasqtRpXn
         GKIA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

     I set up a test platform just as the test example  of  nat-virtual=
-ip :

        http://www.strongswan.org/uml/testresults/ikev2/nat-virtual-ip

     This is  the  detail of testing platform which I used  :

moon :
    cpu: 333 MHz PowerPC
    RAM memory: DDR2 256 MB
    software: Linux 2.6.32 ,strongswan-4.5.2, iptables-1.4.5

SUN =A3=BA
    cpu: 3 GHz x86
    RAM memory: DDR2 3 GB
    software: Linux 2.6.32 ,strongswan-4.5.2

Alice, bob :
    cpu: 3 GHz x86
    RAM memory: DDR2 3 GB
    software: Linux 2.6.32 ,strongswan-4.5.2

    All the configuration script I used is the same as the example
nat-virtual-ip :

          http://www.strongswan.org/uml/testresults/ikev2/nat-virtual-i=
p

   The router moon set up a connection to gateway sun,  and the
gateway sun had assigned a virtual IP address to router

moon. A special updown script on moon specified by
leftupdown=3D/etc/nat_updown dynamically inserted a source NAT rule
which

mapped the IP address of client alice to the virtual IP of moon.

     Then the client alice  send  the udp packets of 100 bytes length
every 10 milliseconds  with about 10 threads at one

time.
    Under these circumstances ,  the  idle of moon's CPU would be less
than 10%, even 0% . As a result , the moon could not

printf anything. If the router moon PING the client alice at the same
time, there would  appear a big time delay  which was

above 10 seconds.

      I had ever  thought that  this phenomena might be arisen from
the low performance of moon'CPU.So I aslo did two

experiments. The first experiment, I used the same hardware platform
to set up the environment as the example of  Test

ikev2/net2net-psk:

          http://www.strongswan.org/uml/testresults/ikev2/net2net-psk/i=
ndex.html

      And I want to know what would happen with this instance. The
result is that  the  idle of moon's CPU would be  more

than 90% all the time and there was not any big time delay when the
router moon PING the client alice at the same time

,which was fewer than 1 milliseconds all the time.

      The second experiment,  I used the same hardware platform to set
up a  environment which just set up the NAT and

open the ip_forward in the moon. And the udp packets of alice sent out
to the gateway sun only through the NAT of moon. The

result is  that  the  idle of moon's CPU would be  more than 95% all
the time and there was not any big time delay when the

router moon PING the client alice at the same time, which was fewer
than 1 milliseconds all the time.

     These two experiments had approved that the "big time delay"
phenomena was not arisen from  the low performance of

moon'CPU. They were both working well when the NAT was separated from
the IPSEC. But when joined the NAT and IPSEC together

in the moon, the moon could not work normally. Why ?  Is this  a bug
of Netfilter ?


 Regards ,



                                    Kenxin
