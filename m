From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: my system is under syn-flood attack
Date: Mon, 23 Sep 2002 10:19:59 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D8ECEAF.5030202@fugmann.dhs.org>
References: <002201c262ae$36db04b0$9801010a@redhat73> <1203.202.64.212.174.1032761028.squirrel@pat.i989.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: pat@pat.i989.net, chenlf@cibn.com
Cc: netfilter@lists.netfilter.org

Patrick wrote:
> Please try to implement the syn-flood rule in prerouting chain:
> please goto the following web site for reference:
> 
> http://www.samag.com/documents/s=1824/sam0201h/0201h_s1.htm
> 
Please do not do as the above link suggests.
The above link suggests putting DoS attack detection in the nat table,
which IMHO is a very bad idea.

The nat table should be used to changes soruce and destination of
packets - no more.

The mangle table should be used to change packets only, e.g TOS settings.

The filter tables shoyld be used to accept and drop packets (filter
packets). This tables is the one must people should use.

As for the flood attack, What do you mean by "it's no use"? (I do
understand that you think it does not work, but could you elaborate on
that). Are no packets dropped because of it?


Regards
Anders


