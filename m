From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: RE: block kazaa using iptables
Date: Wed, 30 Apr 2003 11:15:49 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304301115360.318@dns.toxicfilms.tv>
References: <2CE951F1A7DC0644A33B9F763D2029C0012A2867@mail.it.farmingdale.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2CE951F1A7DC0644A33B9F763D2029C0012A2867@mail.it.farmingdale.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gladson George <georgc@FARMINGDALE.EDU>
Cc: netfilter@lists.netfilter.org

> Does anyone have a list of IP addresses for the kazaa servers?
How about:
solt@pysiak:~$ host -t a www.kazaa.com
www.kazaa.com is an alias for rr1.kazaa.com.
rr1.kazaa.com has address 217.116.226.13
rr1.kazaa.com has address 217.116.224.67
rr1.kazaa.com has address 217.116.224.68
rr1.kazaa.com has address 217.116.224.69
rr1.kazaa.com has address 217.116.224.70
rr1.kazaa.com has address 217.116.226.11
rr1.kazaa.com has address 217.116.226.12


