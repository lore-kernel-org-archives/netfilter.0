From: "Mischa Gossen" <mgossen@bmb-bbm.org>
Subject: NAT & Homepage Statistics
Date: Thu, 30 Jan 2003 12:38:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se391cd4.045@mail.bmb-bbm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello,

Recently I've installed a webserver behind my firewall. On my website I
keep statistics where my visitors come from. This is based on the
IPadrress they have. 
Ever since I run my webserver behind my firewall (which NAT's to the
inside), all the users come from the IPaddress of my firewall. This way
I don't have any statistics anymore :(
Is there any possibility that I can keep my NAT on the inside of my
firewall and my webserver can retreive the right IP from the visitors.
And if it isn't possible, is there a elegant workaround for it?


Thanks in advance,

Mischa


