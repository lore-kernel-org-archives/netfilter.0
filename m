From: Askar <askarali@gmail.com>
Subject: Re: How do I envoke the firewall script? (nfcan: addressed to
	exclusive sender for this address)
Date: Sat, 4 Dec 2004 13:12:49 +0500
Message-ID: <a0f69e5041204001269f7b7de@mail.gmail.com>
References: <200412020847.AA199754942@mail.cybercorpinc.com>
	<20041203152701.GA13924@salty>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041203152701.GA13924@salty>
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
To: nfcan.x.jimlaur@dfgh.net
Cc: netfilter@lists.netfilter.org

or call your fw script from rc.local , it will run on each boot

hope this will also helps

regards

On Fri, 3 Dec 2004 10:27:01 -0500, Jim Laurino <nfcan.x.jimlaur@dfgh.net> wrote:
> On 2004.12.02 11:47, Glen Spidal - glens@mail.cybercorpinc.com wrote:
> > Greetings,
> >
> > I've edited the script from Oskar Andreasson's tutorial for a DMZ firewall
> > (rc.DMZ.firewall), but since I'm kind of a newbie I don't know how to
> > automaticvally run it at startup.  I have a fresh minimal install of Redhat
> > 9.  I selected medium firewall with this install.  How do I undo that and
> > run only the DMZ firewall script?
> > I manually ran the DMZ script without errors.
> 
> I have a Redhat system.
> After I change a script, check it into cvs, and test it
> I use on the Redhat "service" script
> to store the changes for the next boot:
> 
>   sudo service iptables save
> 
> This script should produce an [OK] response.
> 
> The Redhat system will reload from this save at the next boot.
> 
> I put the related /proc/sys/net... switch settings in rc.local
> 
> I hope that helps.
> 
> Jim
> 
> 


-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

