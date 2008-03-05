From: Rich <rhdyes@gmail.com>
Subject: Trying to connect 172.31.0.0/21 on 2 different networks through iptables
Date: Tue, 4 Mar 2008 22:17:22 -0500
Message-ID: <8fb205ea0803041917o50cf3cbl814eb5f011fc9c72@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=v0aHUK9vlDPmA44aHwcKTdKNMROE8xrQXQb8W8hon8I=;
        b=WJU79K6LLuorTOatCqIw6gwp1FXDbeJbAmpgZVslODU39p2PPCA32Da9IIOMSeWdBYW8qVKzku4T0icfhBziLNH808xkSshFpwKDgPBb5oywUE974uuP2048nmJmisp5KQONnv2PMPIff/dKQaBMJr3s6Jwc1k12TTxov+v3spo=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a challenge I am trying to solve. I work in a county and we
have been passing ip traffic over an iptables gateway for a few years.
Here is the setup

MY side gateway county side
172.31.0.0/21 eth0 172.31.5.240 main ip network is 10.0.0.0/128 with a
192.168.14.1 interface to my eth1
eth1 192.168.14.12

This has been working great with no problems. I have been linking to 2
servers on their side. A Novell and a Lotus Notes Server and they have
been link to our Novell and Lotus notes servers.

Now here is the dilemma.

The county has decided to consolidate our IT operations. We will be
consolidating our Notes and Novell servers and consolidating our
workstations onto their physical network. We decided in our planning
that we would keep our 172.31.0.0/21 ip scheme. So we have brought in
new switches and router running parallel to the old ones. They come
into our buildings and link back to the county network. The new
infrastructure in no way physically touches our existing network. All
the traffic goes to the county network. There are vlans setup with no
problem.
This is the issue.
How can I get the "new" 172.31.0.0 network to talk to the old
172.31.0.0 network till the conversion is done and the old 172.31.0.0
network is decommissioned. I tried to use the same iptables gateway to
go from the new network to the old to no avail. Can this be done? Can
I do it by building a seperate iptables router to handle the traffic
coming from the new network to the old?
