From: "William Olbrys" <william_olbrys@student.uml.edu>
Subject: ip range generic matches
Date: Wed, 26 Feb 2003 01:23:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7dfe27f780.7f7807dfe2@student.uml.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Language: en
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

is there a syntax to to create a generic match for a range of ips
instead of the whole thing? 

ex.: $IPTABLES -t filter -A FORWARD -s 10.1.2.0-10.1.5.255 -j ACCEPT

i tried to do this and it gave me an error about not being able to find
the host. is there a workaround?

will olbrys



 E2-O: The presence of this footer indicates the message has been scanned for viruses by the WebShield e500.



