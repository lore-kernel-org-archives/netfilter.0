From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: Filtered Port
Date: Tue, 31 Jan 2006 07:55:04 -0600
Message-ID: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
Reply-To: sgmayo@mail.bloomfield.k12.mo.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

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

