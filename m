From: "M. Ziya Ozudogru" <e116132@metu.edu.tr>
Subject: Re: mac/ip match
Date: 19 Sep 2003 13:40:58 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063968058.3305.0.camel@tux>
References: <1063909559.19096.12.camel@tux>
	 <1063911472.844.7.camel@elendil.intranet.cartel-securite.net>
	 <1063911877.19096.16.camel@tux>
	 <1063912619.845.11.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063912619.845.11.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Thanks a lot for your valuable help. I think this will solve my problem
On Thu, 2003-09-18 at 22:17, Cedric Blancher wrote:
> Le jeu 18/09/2003 à 21:04, M. Ziya Ozudogru a écrit :
> > Thanks for your help but how can i assure that given mac is using the ip
> > i assign to it? And if it is using its assigned ip it should pass if it
> > is not it should be blocked
> 
> If all your rules are this kind :
> 
> 	iptables -A FORWARD -m mac --mac-source $MAC -s $IP -j ACCEPT
> 
> Then an unknown MAC address won't be able to get through and a known one
> will accepted _only_ if used with correct source IP. Isn't it what you
> wanted or am I missing something ?


