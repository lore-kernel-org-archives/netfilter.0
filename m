From: Nick Drage <nickd@funkyjesus.org>
Subject: Re: What ICMP packets does state RELATED allow?
Date: Wed, 5 Jun 2002 23:29:34 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020605232934.G2090@funkyjesus.org>
References: <012801c20cdd$5cb24d50$2925ae3f@amos>
Reply-To: Nick Drage <nickd@funkyjesus.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <012801c20cdd$5cb24d50$2925ae3f@amos>; from nathan@cjhunter.com on Wed, Jun 05, 2002 at 03:07:20PM -0700
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

On Wed, Jun 05, 2002 at 03:07:20PM -0700, Nathan Cassano wrote:
> 
> Hi NetFilter Gurus,
> 	I have heard that ip_conntrack will allow ICMP packets pass that
> are related to an existing connection. My question is what specific
> related ICMP packets does conntrack allow for a given connection? Does
> it allow Source Quench (--icmp-type 4) or Redirects (--icmp-type 5)? 

See Joe's rather excellent answer to my previous question along these lines:

http://lists.samba.org/pipermail/netfilter/2002-May/023188.html

-- 
FunkyJesus System Administration Team


