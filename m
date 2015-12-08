From: Justin Michael Schwartzbeck <justinmschw@gmail.com>
Subject: IPTables connection mark rule stops working
Date: Tue, 8 Dec 2015 16:57:09 -0600
Message-ID: <CAGEc96=kjP8yi_3WyFv1xKcqzoLvrpZLNDKPsxc9vnmtoD1pYQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=P1RrVPVlsxufeyKm3NaVZGRyYJSKAu+ZeqbN+lmcHCE=;
        b=XrJyfxeN+e6i+kwAqpAtMUBauGHFOaY75Vk6muTjEtlzgap+70Puvf2UtWNcOmdT3Y
         YbpEAgTc54nmWfcTUj3CSo7mjpLjn4rFaihwkdvdasUUG0TYrtc6WyLOQvA/PetMCNtu
         VCtC+VfiNc0YdZ8tOPCctW38ZZYb8zOBNZRRthqQPVN+Z+zqn7MguY8mQW04psUomhHt
         izW00muai7OKfztVI9PK/Fwwa+gQp1Ta/e66y+8F5kRerSYuxqkmINt69PbIqhiaZBMt
         kSWlT+RBpTI2paIh23zXqM5izFcVE7uT28Ur4VFrIqHZ5IOt5MdipC2PiM9KE+k0WDSA
         7sSA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I was not sure whether to post this in netfilter or netfilter-devel.
Here is my situation:

I have a kernel module that examines traffic that is forwarded to a
linux VM and, depending on certain information in the packet, will
mark that connection accordingly. I use the following line: "skb->mark
= 0x01" where skb is the socket buffer that is passed to a prerouting
hook in the kernel module.

Next, I have an iptables rule that DNATs the traffic based on the
connection mark. For example, mark 1 goes to port 8080, mark 2 goes to
8443, etc. The iptables rule looks like so:
iptables -A PREROUTING -p tcp -m mark --mark 0x1 -j DNAT
--to-destination (proxy ip):8080

Now, 99 percent of the time this works just fine, the connection is
marked, and it gets redirected by the iptables rule, and everyone is
happy. But once in a blue moon, it will randomly just stop working.
Here is what I have gathered so far: I have traffic being forwarded to
my VM as usual. Now I know the traffic is being marked in the kernel
module because I have a log message that goes to syslog from the
kernel module indicating this. But the traffic does not get DNATed.
When I look at "iptables -t nat -vL" I can see that the count for that
rule is not going up. Eventually I just power cycle the VM and
everything goes back to normal. I am wondering how I can troubleshoot
this. What might cause this problem to occur? My first instinct is
maybe some table is being filled up (perhaps connection tracking?) but
when I check syslog I don't see any useful information. I just need
some idea of where to look. What other things can I check?

Thanks,
-Justin
