From: Scott Bronson <bronson@rinspin.com>
Subject: Why isn't DNAT happening for host-originated packets?
Date: Thu, 3 Dec 2015 14:45:28 -0800
Message-ID: <CAKmUPx5kE+v03OGAjF32rOGyVQfOLbSmyTEOOK9uApANeWbU1A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rinspin-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=rKVbhU2qdJViWVxFFOjDJ28Dha5Q6mQWpacW/S09g+M=;
        b=qyYCHSCad/UWSogUms2gWn6FHz3rs0iULYZMEDiFRDcCdoxwfJ6pdl4zjMayJLCF1w
         J8g+ABMGgyBgsfrVq32qHkcL9qHkT2F+8OHsQRS4l/rVn/E/C+XD0DBjNhY+5A11NvN4
         TzeyC5Jg9S/t8R23e0aGc8P53KIxpzxUan8/oXlyniSgd6BGEmhaQ5jFpdlUoy5pBqhv
         CwpWOjVfJh5tFVW36J/LOQqamV0MLCi32gNiE+mHE2/+/2ittcz+NNX4icAu4jOIgVOY
         XLNTyabyFhwyk58jnx3bx1wz2EbyQU03hct9hIrESFQpYEniNq7nZVt2PjIUcA267LlM
         KPTA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Near as I can tell, packets originating on the host are skipping the
nat:PREROUTING rule...  This is before routing, so wouldn't externally-
generated packets and internally-generated packets follow the exact
same path?


Background:

I'm trying to forward some ports on the host to a virtual machine.
This is on libvirt's default masquerading/bridged network setup.

Let's add some rules to forward the port with DNAT:

  iptables -t nat -I PREROUTING -p tcp -d 173.233.67.174 \
    --dport 25 -j DNAT --to 192.168.122.10:25
  iptables -t filter -I FORWARD -p tcp --dport 25 -j ACCEPT

This almost works...  Traffic from outside is great.  However, traffic
originating on the host fails.  It doesn't get NATed, it just terminates
on the host.


Here's what I think is happening:

  - The packet originates on the host: 1.2.3.4:55555 -> 1.2.3.4:25
  - It runs through the output chains unmodified. Good.
  - It reappears as input.

Now I would expect that the nat:PREROUTING rule would fire, DNATing
the packet out to the VM.

However, that never happens.  Traffic from outside does hit nat:PREROUTING,
yes, but traffic originating on the host never does.


To test this, I copied the nat:PREROUTING rule to the nat:OUTPUT chain,
so the packets are DNATed in the output stage instead of the input:

  iptables -t nat -I OUTPUT p tcp -d 173.233.67.174 \
    --dport 25 -j DNAT --to-destination 192.168.122.10:25

And everything works!


Here's the raw data: https://gist.github.com/bronson/6fa02c4515f95b104ec1

Thanks for any insight.

    - Scott
