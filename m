From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: logging port 25
Date: Tue, 18 Oct 2005 10:29:57 -0500
Message-ID: <435514F5.9000201@mail.bloomfield.k12.mo.us>
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

I have a private network behind my firewall.  My email server is on the 
outside.  What rules do I need to set in my firewall, so that any mail 
that is destined for my mail server through port 25 is alright, but any 
mail that is destined for port 25 that is not going to my mail server, 
gets logged and dropeed.

I am trying to do this in case I get a virus that uses its own smtp to 
send out mail.

IE:
Internal network:  192.168.x.x
Internal Ip of Nic on firewall: 192.168.0.254
Public Ip of Nic: 68.68.68.68
Ip of mail server:  78.78.78.78

What would I need to put in for my rules?  I thought that I had it down 
correctly, but I am not getting anything in the log.  It does log this 
to /var/log/messages doesn't it?

Thanks for any input.

-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-5669
FA: 573-568-4565
Pager: 800-264-2535 X2549

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.

