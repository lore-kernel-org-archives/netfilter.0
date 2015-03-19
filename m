From: jack seth <bird_112@hotmail.com>
Subject: RE: Is my connection timing out here?
Date: Thu, 19 Mar 2015 09:42:31 -0500
Message-ID: <SNT152-W9B6E108595C0FD4AC2746BF010@phx.gbl>
References: <SNT152-W63AE5FC6C5440BC174F5A8BF190@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <SNT152-W63AE5FC6C5440BC174F5A8BF190@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Could someone please provide some guidance on the below?=A0 If there is=
 a more appropriate list I should post to please let me know which one.=
=A0=20
----------------------------------------
> From: bird_112@hotmail.com
> To: netfilter@vger.kernel.org
> Subject: Is my connection timing out here?
> Date: Wed, 11 Mar 2015 12:46:33 -0500
>
> I am trying to out my Openvpn config using DH parameters 16384 size k=
eys (I know I know but it is testing :)). I am using my working config =
except for substituting my large keys. My config works with a 8192 size=
d DH but not with 16384. I am getting a 'inactivity timeout' from the s=
erver after about 3 minutes during the TLS handshake. I have read it wi=
ll take longer to negotiate with these large keys. Based on other repli=
es I have gotten I suspect that it is the linux/iptables connection tha=
t is timing out and not OpenVPN.
>
> I have tried changing this command to a higher timeout number but it =
doesn't help. sudo sysctl -w net.netfilter.nf_conntrack_udp_timeout_str=
eam=3D???
>
> How can I track down what is happening here? --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
 		 	   		  