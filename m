From: Ron Gedye <rgedye@teleformix.com>
Subject: Re: NetBIOS browsing across subnets
Date: Thu, 4 Jul 2002 19:37:51 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207050038.TAA07319@wendy.tfmx.com>
References: <007201c2239b$a885a8b0$6301a8c0@JJONES1> <20020704204621.JNSG295.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020704204621.JNSG295.mta03-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Thursday 04 July 2002 15 46 r, you wrote:

>
> If anyone knows a way of supporting Windows browsing across a router,
> please speak up :-)
>

Netbios will not pass a router.  The only way to allow this type of browsing 
is to use a WINS Server.  There is a way to set up either a push or pull 
mechanism to share info between different netbios 'zones'. (although it's 
been a few years since I had no other choice than windows networking and 
don't remember the specifics)

Ron

