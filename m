From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: libipfwc memory leak?
Date: Fri, 27 Sep 2002 22:44:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D94C31C.4060207@fugmann.dhs.org>
References: <20020923173958.631b43b5.wireless@wireless.org.ua>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Andriy T.Yanko" <wireless@wireless.org.ua>
Cc: netfilter@lists.netfilter.org

Andriy T.Yanko wrote:
> Hi people!
> 
> In  libipfwc.c  function ipfwc_get_chainnames & ipfwc_get_rules use malloc() but not use free().
> It's maybe ok for program ipchains but in my case is not gut.
> 
> How to fix it?
You have to free the structures yourself. If the functions themself 
freed the structures, they would not be able to return anything.
This is not an error in libipfwc.

Regards
Anders Fugmann


