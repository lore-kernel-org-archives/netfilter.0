From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: bandwidth
Date: Thu, 12 Dec 2002 20:14:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2a212$a0f05050$0401000a@robbysan.org>
References: <3DF8CED1.8030509@corp.lcom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF8CED1.8030509@corp.lcom.net>
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

> There are a couple of situations where I need to limit 
> bandwidth on some of my machines. Can anyone share some 
> solutions they have used? Here are a couple of examples of 

HTB with iproute2 tc utility.
http://luxik.cdi.cz/~devik/qos/htb/ 

Works just fine, easy to configure.


Rob


