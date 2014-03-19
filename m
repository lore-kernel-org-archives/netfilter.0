From: Al Grant <bigal.nz@gmail.com>
Subject: Block connections to company VPN from within own LAN
Date: Thu, 20 Mar 2014 06:59:29 +1300
Message-ID: <CAODtcddO6VjX8eP1j0gBAxYDZMU3+=w3=VKWErrb4MMdOm7jTQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=3dQ3eLYjVRinqJJIIpCOXzDc7dmuej5Hgy7TXxUG/M0=;
        b=QkfA+9P5nAixfRsvMJnrovtfHpaMV5AuT1g8S7evu+xVTafGGpm5eNCDV/z1f5aC7Y
         jgIHDbxh7guPMtZCXjsE5pmkUGPQx3Z8dmYCsSN/7rokZtziXtKIY1Gwcz/BBtMC3hjR
         1phlNut5dYBdhVrYfGdJMNbxqLJzmXAZcXRg0bNq2rVKTlFDNNXbRB0OkuISMmDB4Fp6
         pItnqasEfnYsN4Ye2dW+rD3Nuik0OfwomCeRvLiLM3E4UXd3d27Dl7aXMkc9/TfCgvvn
         h1RnaFJlA8WIU4USpbbTVE4G3JrQtwii9d1WyT3jMRCQiIMtA8bTu1KEJ9H3EUdgLUsS
         ixEA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

 Hi All,

I want to set a rule to DROP client connections to our VPN server IF
they originate from within the company?

In other words our road warriors VPN connections which are nailed up,
work when on the road, but they default back to the company wifi or
wired LAN when in the office, because the drop rule will prevent them
the VPN from connecting.

Public IP: 203.123.123.123
Our LAN subnet is 10.1.1.0
LAN Gateway is 10.1.1.1
OpenVPN server: 10.1.1.5 (tun adapters are in the VPN subnet 10.8.0.0)

And finally because the OpenVPN server is behind the router, and not
on it, I am making the openvpn server NAT the client connections to
the LAN subnet. (I couldn't use routing).

So my question is, what should the rule be?

I need to obviously block:
protocol UDP
port 1194

But if a LAN client behind the GW router (203.123.123.123) tries to
connect back to 203.123.123.123 (which port forwards to the OpenVPN
server, what will the src of that packet be?

Does the router let traffic destined for its own public IP let that
traffic leave the WAN interface, or does it realize that its traffic
for itself and route internally?

In any event for the purposes of my rule do I want to block the public
IP address (from itself essentially) when on 1194/udp?

Cheers

-Al



-- 
"Beat it punk!"
- Clint Eastwood
