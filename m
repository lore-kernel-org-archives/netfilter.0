From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: "beep" on match
Date: Tue, 7 Nov 2006 17:07:24 +0100
Message-ID: <20061107170724.3b610de9.arnt@c2i.net>
References: <454FB587.9010806@gmx.de>
	<45502D05.1050807@expertron.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45502D05.1050807@expertron.co.za>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Tue, 07 Nov 2006 08:51:50 +0200, Justin wrote in message 
<45502D05.1050807@expertron.co.za>:

> Erik Alberti wrote:
> > Hallo!
> > 
> > Ich suche nach einer Möglichkeit ein externes Programm bei einem
> > match einer Regel auszuführen. Beispiel:
> > 
> >   iptables ... -j exec("/usr/bin/beep -f 5000 -l 1000")
> > 
> > -------------------------------------------------------------------
> > -----
> > 
> > Hello!
> > 
> > I am looking for a possibility of executing an external program in
> > the field of a match of a rule. Example:
> > 
> >   iptables ... -j exec("/usr/bin/beep -f 5000 -l 1000")
>  
> I doubt you will ever be able to do that directly, but it should be no
>  problem to make a simple application using lipipulog, and
> 
> iptables ... -j ULOG
> 
> So the iptables match sends the packet to the userspace logging
> daemon,  which then does the 'beep'.  Could even use the --ulog-prefix
> option to  specify the text of the command to execute...
> 

..schrägemusik enthusiasts might even wanna try chop up 
conntrack data to feed beep's -f 'n -l...<shudder/>

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;o)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


