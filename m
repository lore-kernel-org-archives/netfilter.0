From: Robert Dahlem <Robert.Dahlem@gmx.net>
Subject: Distinguish local from routed traffic
Date: Wed, 30 Oct 2019 18:31:48 +0100
Message-ID: <6e8b32b1-f11a-b33f-7f04-eb0e47084e6b@gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1572456708;
        bh=l/xUk4dCES9JG5cqYBXKH2LCnqnt31u0hfN9RXmlOFY=;
        h=X-UI-Sender-Class:To:From:Subject:Date;
        b=k1BloC4Pb9T1+gwSi4OwNDZ0xbX11tdtkznmndVnx52LLBvGkaTWsip0FhMBrHV/9
         7J/kMMlZc5S8Ie/Tmr3G38Haj0reCPLHnUMufV3euR3Oz57TwIUwxp5KUPBqCECm0k
         DkNBBHwSAfJplVDCY3puP19jOCx3WuG/T2ZNZIOs=
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I need to distinguish traffic that is delivered within the local layer 2
network and traffic that goes out the same interface but needs to get
routed.

In my case: I need to MASQUERADE local traffic but SNAT routed trafffic
to the IP address of the VPN tunnel.

At the moment I have:

iptables -t nat -A POSTROUTING -s vmbr1 -o vmbr0 -d 192.168.1.0/24 \
	-j MASQUERADE
iptables -t nat -A POSTROUTING -s vmbr1 -o vmbr0 \
	-j SNAT --to-source $VPN_ENDPOINT

where 192.168.1.0/24 is the local network.

Is there a more elegant solution, perhaps something like
	-m addrtype --dst-type LOCAL_NETWORK
?

Regards,
Robert
