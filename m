From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: Question on PREROUTING and INPUT chains
Date: Sat, 9 Nov 2002 07:17:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBJOOEOFODEALNMJAJKEBEHCAA.B-Morgan@concentric.net>
References: <H52KD3$II79GwJU6pjw8ZNZc1oYk1taD6_z_kdUix49OEr@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <H52KD3$II79GwJU6pjw8ZNZc1oYk1taD6_z_kdUix49OEr@uol.com.br>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: =?iso-8859-1?Q?Carlos_Fa=C4=BFanha?= <carlos.facanha@uol.com.br>, netfilter@lists.netfilter.org

> I have a Linux box used as NAT server and firewall. All 
> requests on its port 80 are forwarded to a local webserver 
> inside my network. I want to block access to all services 
> including http from a specific external host.

Carlos,

You almost answered your own question.  "All requests on its
port 80 are forwarded".  So the rule to block a specific IP
needs to be in the FORWARD chain, not the INPUT chain.

Regards,

Brad



