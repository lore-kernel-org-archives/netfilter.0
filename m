From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: How to prevent smurf atacks?
Date: Wed, 5 Jun 2002 14:55:30 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605145530.A2090@funkyjesus.org>
References: <LAW2-F126qZNn1NCpEq000166b1@hotmail.com>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <LAW2-F126qZNn1NCpEq000166b1@hotmail.com>; from pijoman@hotmail.com on Wed, Jun 05, 2002 at 01:27:41PM +0000
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

On Wed, Jun 05, 2002 at 01:27:41PM +0000, Francisco Alfonso Martinez Lopez wrote:

> Hi everybody,how I can denied smurf atacks over my host,it's a single
> connection to Internet,any possibilitie of denied smurf atack on the
> firewall?(my host execute dual boot:suse linux&windows)

A Smurf attack is effective just by the sheer weight of traffic sent to you,
rather than because of any weakness in your host, so unfortunately there is
nothing you can do on your host to harden it against this type of onslaught.

That's my understanding anyway, security related terms can become quite
imprecise over time, so I think we're discussing the same thing.

> Thanks in advance,folks!!(...and sorry for my english)

No problem :)

-- 
FunkyJesus System Administration Team


