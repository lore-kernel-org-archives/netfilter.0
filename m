From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 03:17:12 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031013031712.7fd7be69.arnt@c2i.net>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
	<3F89ED5C.3050507@snapgear.com>
	<200310121820.59977.Herman@AerospaceSoftware.com>
	<200310121840.27031.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121840.27031.Herman@AerospaceSoftware.com>
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

On Sun, 12 Oct 2003 18:40:27 -0600, 
Herman <Herman@AerospaceSoftware.com> wrote in message 
<200310121840.27031.Herman@AerospaceSoftware.com>:

> The real problem that I'm trying to solve is this:
> Several hosts need to acces a gov service that uses Java and a certain
> port.  

..if these hosts are initiating this connection from your end, 
" -j ESTABLISHED,RELATED" should do it, instead of you 
running around chasing your tail. 

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



