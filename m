From: Bruno de Paula Larini <bruno.larini@riosoft.com.br>
Subject: Re: FTP NAT fails after kernel upgrade
Date: Tue, 18 Jul 2017 14:12:55 -0300
Message-ID: <a3f1ab92-1630-6a7b-1dd2-234989aad083@riosoft.com.br>
References: <26299185-e18e-bf19-f52e-969c0744594c@riosoft.com.br>
 <c1b4d15d-1049-42fd-4a6b-d5f48a32392d@riosoft.com.br>
 <6dd149d1-69ca-7f60-7d95-8951f9dfa5b7@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <6dd149d1-69ca-7f60-7d95-8951f9dfa5b7@free.fr>
Content-Language: pt-BR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Em 17/07/2017 20:04, Adel Belhouane escreveu:
> Seems I missed an email too. To keep things very simple:
> I'd say revert to the pre-kernel 4.7 way (see why it didn't work in
> my other email) and keep all the rules, or switch to
> nf_conntrack_helper=0, still keep all the rules, and just add these two
> rules to mimic the former behaviour:
> iptables -t raw -A PREROUTING -p tcp --dport 21 -j CT --helper ftp
> iptables -t raw -A PREROUTING -p tcp --dport 2121 -j CT --helper ftp
>
> Copy a working configuration, like the configuration used in
> production. Try to not change it beside the minimum (to prevent new
> problems like missing nf_nat_ftp) and forget about "securing" the rules
> for now until it works (like before).
>
> regards,

Hi Adel, thanks for your answers so far.

Please ignore that ESTABLISHED in the place of RELATED. I was trying 
several things and sent it wrong in the email.

So, I did exactly what you told. I've preserved all my rules, but set 
nf_conntrack_helper=0, added the line at the raw table (port 21) and 
restarted my test machine (to be sure nothing is loaded wrongly). The 
policy for FORWARD is still ACCEPT just to be sure nothing is being 
dropped. The sysctl files are empty.

As before, from the public side I can connect but not from LAN.

I added a NAT rule for port 2121 in the test machine (available like 
that to the public side). Without the helper it does connect through 
port 2121 both from outside and inside, only failing to estabilish the 
data channel. If I enable the helper for that port, the connection times 
out while trying to estabilish the *control channel*. However, with LOG 
I can see it reach POSTROUTING.

Summing up: any port with the ftp helper is timing out while 
establishing the control channel when a LAN originated connection goes 
back to a host in the same LAN (via firewall's public IP). SNAT is used 
to deliver it to the LAN using the firewall IP.

Does anyone know why this would happen?

