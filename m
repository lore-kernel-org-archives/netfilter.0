From: jack seth <bird_112@hotmail.com>
Subject: Is my connection timing out here?
Date: Wed, 11 Mar 2015 12:46:33 -0500
Message-ID: <SNT152-W63AE5FC6C5440BC174F5A8BF190@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I am trying to out my Openvpn config using DH parameters 16384 size keys (I know I know but it is testing :)). I am using my working config except for substituting my large keys. My config works with a 8192 sized DH but not with 16384. I am getting a 'inactivity timeout' from the server after about 3 minutes during the TLS handshake. I have read it will take longer to negotiate with these large keys. Based on other replies I have gotten I suspect that it is the linux/iptables connection that is timing out and not OpenVPN.

I have tried changing this command to a higher timeout number but it doesn't help. sudo sysctl -w net.netfilter.nf_conntrack_udp_timeout_stream=???

How can I track down what is happening here? 		 	   		  