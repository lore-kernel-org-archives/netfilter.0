From: "R. Benjamin Shapiro" <bshapiro@getdown.org>
Subject: status of PPTP Masquerade + PPTP Server on Gateway?
Date: Tue, 18 Nov 2003 20:05:07 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBACFD3.3000701@getdown.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Netfilterers,

I have spent considerable time today trying to get PPTP Masquerade 
working on a firewall that also happens to be the PPTP server people use 
to connect to our network. Our setup is such that we often have a few 
people inside the firewall connecting out and several connecting in. I 
applied the pptp-masq patch from the patch-o-matic to my 2.4.22 (+ mppe 
for pptpd) kernel. I see to either be able to have people come in 
reliably or people go out reliably, but people cannot connect in if the 
gre and pptp masq modules are loaded. I have the local_nat option turned 
on in the kernel.

Am I doing something wrong or is this setup still not available?

Thanks very much,
Ben

