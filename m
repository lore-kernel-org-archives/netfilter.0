From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: problem :(
Date: Tue, 5 Oct 2004 16:25:42 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410051625.42245.danielf@supportteam.net>
References: <200410051246.i95Ckk029881@securegate.mailserver.gajshield.com>
	<4163063A.3030103@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4163063A.3030103@o2.pl>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

you must go into the pom dir and run ./runme extra and chose the extra modules 
you want form the menu er.. list you will see what I mean when you do this. 

once that is done you do the make && make install for iptables and then 
recompile your kernel and select the new options install kernel reboot viola 
it should be done. 

Thanks I hope that helps if not let me know more details. 


On Tuesday 05 October 2004 15:38, Krystian wrote:
> hi
>
> i have a small problem with installing pom.
> i install pom, make & isntall kernel, make & install iptables and i end
> with no pom extensions in my iptables. the files r in the extensions
> directory of iptables, but dont get compiled.
>
> any clues what i did wrong?
>
> :)

-- 
"Unix IS user-friendly. It's just picky about who its friends are."
_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
C I Host. 1851 Central Drive Suite 110. Bedford, TX 76021
T. 888.868.9931 ext 7103
F. 888.241.2294
http://www.cihost.com
-------------------------------------------
Privileged/Confidential Information may be contained in this message.  If
you are not the addressee indicated in this message (or responsible for
delivery of the message to such person), you may not copy or deliver this
message to anyone.  In such case, you should destroy this message and kindly
notify the sender by reply email.  Please advise immediately if you or your
employer do not consent to Internet email for messages of this kind.
Opinions, conclusions and other information in this message that do not
relate to the official business of my firm shall be understood as neither
given nor endorsed by it.

