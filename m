From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: CnC General and ipitables woes. Need HELP PLS!
Date: Thu, 17 Apr 2003 10:15:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030417171549.19806.qmail@web40208.mail.yahoo.com>
References: <se9e77b9.047@michiganfamilyresources.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se9e77b9.047@michiganfamilyresources.org>
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
Content-Transfer-Encoding: 7bit
To: nf <netfilter@lists.netfilter.org>

I don't believe the problem lies in iptables really. What I think the culprit
is ....is the game makers are not adhearing to TCP/IP standards. Now I'm no
guru on TCP/IP or even more to the case UDP which is what games seem to use. I
think if the makers of Counter Strike can get it right then so should the
others. I had NO problem routing it to internal machines.

That being said I don't think everyone should be left in the cold. If iptables
is to be a real world firewalling soloution... it's going to have to work with
the good and bad implimentations of programinng/TCP/IP stacks etc. So like I
had mentioned before I think some sort of connection tracking module will be
needed... unfortionally I don't know how to program :{{

Now I must reply to the other message I got from Sassan... heh stay tuned!


--- Bret Holbrook <bholbrook@michiganfamilyresources.org> wrote:
> I also had the same issue with CnC and there is an .ini file with a port
> over-ride in it, but adjusting it produced no successful result.  I am
> also struggling with NWN.  After putting all the appropriate prerouting
> commands in as you did with all the ports they suggest, it still does
> not work.  There have been many other games I've struggled with also.  I
> have actually only been able to get a fraction of them working.  It
> seems by the time I get the rules working and am done scouring the
> internet for help, we are playing a different game :).  I am considering
> just plugging my dedicated linux server into the internet, setting up
> basic masq for my internal pc's to surf, burning an image of the HD, and
> leaving it wide open to attack from the internet.  If some kid wants to
> run a newsgroup server off it, fine, as long as I can play my video
> games with my buddies in college.  Setting up basic Iptables was no
> sweat, this more advanced routing for video games and such is extremely
> complex to the un-learned.
> 
> >>> "Sascha Reissner" <sascha.reissner@toxicnet.de> 04/16/03 10:53PM
> >>>
> From: "SBlaze" <dagent.geo@yahoo.com>
> 
> [...]
> 
> > So my question is... is some sort of con. tracking mod needed? Anyone
> know
> > anything about this problem? Thanks for your time and help anyone
> 
> [...]
> 
> Those kind of games tend to include the IP address of the "gaming"
> machine
> withing the payload of their datapackets.
> 
> As i don't know that game i can just tell you that you might want to
> take a
> look into .ini files or parameters for the game to override that
> behaviour.
> 
> Some games allow players via parameter to set a different ip that will
> get
> included into the data payload.
> 
> Greets,
> Sascha
> 
> 
> 
> 


=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo
http://search.yahoo.com

