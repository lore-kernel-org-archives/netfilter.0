From: =?ISO-8859-1?Q?Thomas_Lu=DFnig?= <tlussnig@bewegungsmelder.de>
Subject: Re: Blocking Netranges Based on IP-to-Country CSV
Date: Mon, 20 Sep 2004 14:06:10 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <414EC7B2.5000904@bewegungsmelder.de>
References: <7EACCDBB65D37443912D80713CC1245D02382B06@fsnsab20.losangeles.af.mil>	<20040917114613.GP452@metastasis.org.uk>	<1403218a0409190209416c12b9@mail.gmail.com>	<20040919110111.GA706@metastasis.org.uk>	<1403218a04091904173de016ea@mail.gmail.com>	<3063e504091904456844d5cf@mail.gmail.com>
	<20040920115357.GE3786@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040920115357.GE3786@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Drage <nickd@metastasis.org.uk>, netfilter@lists.netfilter.org

Hi,
i read some time the discussion about IP blocking based on Country.
Also there are some postitive Arguments for this idee. I personly think
that an include of this feature is
- Extereme overload for IP-tables since it need extreme large table of 
ip lists
- Is extreme faulty since IP's are not original assinged to country but 
locations like Europe.
- Political / Programming aspects. The kernel and iptables contain 
technical part wich mean
  plock an port, ip , range based on time flages etc.. It never 
contained Localisation like different languages for
 error reports and never country based selections.
- How you wan't to do the next step someone say i not wan't to select 
based on country bot wan't different web server
 for region's with different main language. ASIA -> UTF8/Chinese Europe 
Latin1/Frensh,German,English America => Spain/english
 there are many god ground for large selection map but NONE OF THEM is 
good enaught to include such maps in the kernel or iptables.

Cu Thomas

