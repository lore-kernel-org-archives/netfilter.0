From: "jon hale" <jon.h.hale@gmail.com>
Subject: Policy routing problem using group id, fwmark, and iproute2
Date: Tue, 19 Aug 2008 15:34:19 -0700
Message-ID: <abe9c56e0808191534m25ffbfe9qba0c60dd8b68c3df@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=uysCFl462ZQqInt0sesaDEoSxZ3dOH9PuiU2ooikhK0=;
        b=pAH8Z/WaaPHYBq8IdPYOv36dDRa/9CPOZy36/wsYG7aJPv+8qnxU7xiMSD2Pvtp2Ie
         vOTLHga7e3FymLUukpg+6euM1f9x1IpMvvND+8HW6f0ZF3Wqit99otkm4zlGCSdvwsz3
         daOUa6gtUTXjSeHLc0x9evNE9xgIAZAvgjDoE=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Synopsis:
        I have been trying to set up policy routing based upon the group id
        of the process sending the packets.

        It works for most packets, but there is some scenario that happens at
        the end of every ftp upload, where the packet goes out the wrong
        interface and gums up the works.

        I am doing this using iptables and iproute2 features. When I change
        my iptables fwmark rule from marking gid-owner packets to marking
        packets based on their destination address it all works fine.

Details:
        in /etc/iproute2/rt_table I added a table p0

        I added a rule (with ip ru add) "from all fwmark 0x1 lookup p0"

        I bring up my ppp daemon and I get the following address
        (from ip addr sh ppp0):
                 inet 70.223.3.172 peer 66.174.168.192/32 scope global ppp0

        I create the entries for table p0:
                TARGETIP dev ppp0  scope link
                default via 66.174.168.192 dev ppp0  src 70.223.3.172
        I take the ppp0 default rule out of table main.

        I added some iptables rules:
                iptables -t mangle -A OUTPUT -m mark ! --mark 0 -j ACCEPT
                iptables -t mangle -A OUTPUT -m mark    \
                        --mark 0 -m owner --gid-owner $GROUP_0 -j MARK \
                        --set-mark 0x1
                iptables -t mangle -A OUTPUT -j CONNMARK --save-mark
                iptables -t nat -A POSTROUTING -o ppp0 -j SNAT \
                        --to-source 70.223.3.172
        I then flush the route cache (ip route flush cache)

        Now I run ftp and upload a file. Ouch! A few of the packets go out
        my eth0 interface.

Interesting facts:
        I can successfully upload a file up to size 4344 bytes. When I try using
        a file of size 4345 bytes. Things go bad. 4344 is interesting because
        this is three times the tcp payload of one packet.

        If I change the  --set-mark rule above to :
                iptables -t mangle -A OUTPUT -d $TARGET -j MARK --set-mark 0x1
        Then everything works fine. But this will not accomplish my larger goal.
        My larger goal is having two processes owned by the same user, but in
        different groups to be able to have packets to $TARGET take different
        routes.

        If I change the --set-mark rule above to match on the uid instead of
        the gid, I still have the same problem.

Versions of things:
        #ip -V
                ip utility, iproute2-ss070313
        #iptables -V
                iptables v1.3.7
        #linux kernel  2.6.22.9 WITHOUT SMP

I need a clue.
Or maybe just help understanding the clues that I do have.
Thank you,
-jon
