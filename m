From: Jan Du Caju <Jan.DuCaju@kuleuven.net>
Subject: Re: connection limit for UDP
Date: Thu, 4 Nov 2004 09:12:26 +0100
Message-ID: <20041104081226.GA16468@kuleuven.net>
References: <4187E5DF.6040509@o2.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4187E5DF.6040509@o2.pl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krystian <optimusprime@o2.pl>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

On Tue, Nov 02, 2004 at 08:54:07PM +0100, Krystian wrote:
> Hi
> 
> I there a way to limit connections one host can make to another host 
> ("dstlimit" like), but for UDP?
> 
> I know UDP doesnt have FIN... but I thought since do connection can be 
> assumed closed after some time of innactivity i ...
> 
> is there a way? :)

I once posted (february 2003 ) udplimit (a shameless copy of iplimit of 
Gerd Knorr ;-) I never got any reaction except from the people who also 
needed it at that time. By the way iplimit 's current name is connlimit. 
If you can't find it in the archives I can mail it.

Greetz,
Jan.
------------------------------------------------------ KULeuvenNet ----
Jan.DuCaju@kuleuven.net			        http://www.KULeuven.Net
Katholieke Universiteit Leuven               http://kuleuven.be/english
LUDIT - KULeuvenNet				    http://www.ludit.be
-----------------------------------------------------------------------

