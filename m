From: Krishna Prasanth <krishnap@teneoris.com>
Subject: Re: (no subject)
Date: Mon, 31 May 2004 17:23:30 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opr8u4ngt3u1jv19@192.168.1.10>
References: <E1BUl7h-0008Sb-0a@vishnu.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1BUl7h-0008Sb-0a@vishnu.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: mz@sea.uni-linz.ac.at
Cc: netfilter@lists.netfilter.org

Hi!
   How about blocking Stream connections, which are mostly RTP, RTSP(Real 
Audio uses this)??
   In this case VoIP traffic may not work(in case if you have).
   I think even other Applications like (winamp) uses similar traffic which 
we can
   block using iptables.

   Pls correct me if i'm wrong somewhere.

regards
-prasanth
On Mon, 31 May 2004 13:39:21 +0200, Markus Zeilinger 
<mz@sea.uni-linz.ac.at> wrote:

>  Hi!
>
> Do not know whether there is a patch available via patch-o-matic for such
> things. But I think a http proxy should handle such things? Cause you 
> have
> to do application level filtering and that's a duty of a http proxy I 
> would
> say!
>
> Cheers,
> Markus
>
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ivan
> Sent: Monday, May 31, 2004 1:19 PM
> To: netfilter@lists.netfilter.org
> Subject: (no subject)
>
> Hi,
> I am looking for a solution to block streaming media using iptables.
> I have found that some of my users are listening to radio stations using
> internet, which has pumped up the
> internet bill significantly, and of course put a choke on my internet 
> links.
> Does anyone know of a solution for blocking just the streaming media
> traffic from any web site, while still allowing
> the access to the website it self?
>
> Thanks,
>
> Ivan
>
>



-- 
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

