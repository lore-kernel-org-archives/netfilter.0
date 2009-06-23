From: =?ISO-8859-1?Q?Javier_G=E1lvez_Guerrero?= 
	<javier.galvez@entel.upc.edu>
Subject: Trying to add RTP proxy extension
Date: Tue, 23 Jun 2009 13:03:30 +0200
Message-ID: <145d4e1a0906230403td01d6d8s2541d99ca07e9c6@mail.gmail.com>
Reply-To: javier.galvez@entel.upc.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:reply-to:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=JMX+5slQH9jkn3m2V1v7BwtfOSCCqWGynvj//ukzPFY=;
        b=k/VDLuqjrY7gZMkzcw6RPXNCmFDPjM3cWLhMgHiEPzsz9ZLsBgovz9Pp0dJXcLe4HT
         UfgaUn146YyQIM/2l9fcU6Xts4H1Pb9DbuS70JsgPqwz5wenrGUvnXJo0rzdrfld4nQ2
         I6JBlBdZNo6Ut5qJZFEDWhCjJVXAe2KkYBJ6I=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all,

I'm trying to add the Netfilter RTP proxy extension provided here:
http://www.2p.cz/en/netfilter_rtp_proxy. As install notes say, it must
be done with p-o-m, but I have a problem when running ./runme: the
iptables source directory is not accepted. I've seen many questions on
the web regarding this issue but I got no solution at all.

However, AFAIK, p-o-m is 'deprecated' and Xtables-addons should be
used instead of it. Anyway, I don't know how to 'port' the
installation from p-o-m to xtables-addons as the files included in the
RTP proxy extension package seem to be organized for p-o-m.

I'm using Debian Lenny 2.6.18 with iptables 1.4.2 and I'm trying to
install Netfilter RTP proxy extension 0.4. Can anybody help me to get
it installed?

BTW, is there any other iptables-based solution to mangle
SIP/NAT/SDP/RTP sessions issues in multimedia streaming applications
such as VoIP?


Hope you can help me. Thanks a lot for your time.


Regards,
Javi
