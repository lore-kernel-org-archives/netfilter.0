From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: proxying along with iptables
Date: Sun, 3 Nov 2002 11:58:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c28327$e1777220$0401000a@robbysan.org>
References: <20021102110858.MCO292.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021102110858.MCO292.mta03-svc.ntlworld.com@there>
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

> > > > would be most welcome. What are the proxying products 
> that could run
> > > > along with iptables but which can talk with a windows 
> NT/2000 based user
> > > > base for authentication ? Does squid provide for this ?


> Okay, squid will do ftp and http proxying for you; I don't 

Squid can also do user authentication against a NT/2000 server.
There are multiple options on how to achieve this ; you need samba.
See : 
http://www.squid-cache.org
http://www.squid-cache.org/Doc/FAQ/FAQ-23.html
http://www.hacom.nl/~richard/software/smb_auth.html


Rob


