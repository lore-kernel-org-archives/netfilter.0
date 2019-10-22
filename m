From: Ttttabcd <ttttabcd@protonmail.com>
Subject: How to implement transparent proxy in bridge through nftables
Date: Tue, 22 Oct 2019 08:02:34 +0000
Message-ID: <Nvqi4FOJQaMWqaK3fKSuAiB168CYDyZI1uf8_peoeV3N0J-l0r8yt6GBJG21iY5dMA8t8-2WfyZ8A0GG6UDGEA6Y3KJKAaRUB7fEKmujlqk=@protonmail.com>
Reply-To: Ttttabcd <ttttabcd@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1571731362;
        bh=J02+z6N0OImzY90ezirAO66MBw0GrT4R50v9V06BjQA=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=baFHZiY89t7GqWI9C59pTX7fhJlpLogAcytjGp8tGWIkoOYdMBVMYtWPjlvcq/CQM
         8oVMXBIQbLwbs5JEXO9Lbj+9PQUEbvXHoM95ohDk1+QMsaQLssSn/Y0dfPJv6tFbLN
         mH0Uoj2BEsvJGx/+Ay/DzQ5HKCwi7RhsoS/+ZAdE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

In ebtables, I can pull the direct Layer 2 forwarding traffic to the networ=
k layer through the "broute" table, but I can't find the "broute" table in =
nftables.

Later, I want to perform target MAC address redirection in PREROUTING, and =
change the target MAC to the bridge itself or the MAC of the slave interfac=
e, so that the data frame can reach the network layer.

But nftables doesn't seem to be able to perform MAC address redirection in =
bridge families, so there is no way to use it.

Finally, I searched the Internet for a long time, found br_netfilter, can o=
pen bridge-nf-call-iptables to pass the bridge frame to the iptables hook p=
rocessing, but nftables does not support this feature.

Now I have tried all the methods that I can think of and can search. All of=
 them are not working. I can only come here for help.

Can someone tell me how to run transparent proxy in the bridge with nftable=
s, and the transparent proxy uses the tproxy module.

Does anyone know how to do it?
