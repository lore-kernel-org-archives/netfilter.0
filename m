From: Burak Ozgoren <BOzgoren@gunessigorta.com.tr>
Subject: Re: Filtered Port
Date: Tue, 31 Jan 2006 17:35:45 +0200
Message-ID: <OF97E2A442.CD46230A-ONC2257107.00555AB7-C2257107.0055F0E2@gunessigorta.com.tr>
References: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have another rule after preouting,   postrouting snat (for the firewall 
itself) for that purpose. Packets coming from outside going to inside 
machine as from firewall machine.

May be helps.






Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us> 
Sent by: netfilter-bounces@lists.netfilter.org
31.01.2006 15:55
Please respond to
sgmayo@mail.bloomfield.k12.mo.us


To
netfilter@lists.netfilter.org
cc

Subject
Filtered Port






***********************
Your mail has been scanned by InterScan VirusWall.
***********-***********


I am not sure if this is my iptables or not, but I am not sure where 
else to look or ask.  I am trying to use Remote Desktop on a computer. 
 From inside my network, it works fine, but once I get outside, I cannot 
use it.  I have set my IPTABLES to forward anything going to port 3389 
to the computer that is using Remote Desktop.

The problems seems to be that port 3389 is filtered.  I can find nothing 
in my iptables where I have this port filtered.  Are there some generic 
ports, that IPTABLES filters on it own or something?  If the IPTABLES 
are not filtering it, what else could be?

Thanks.

-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-5669
FA: 573-568-4565
Pager: 800-264-2535 X2549

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.





