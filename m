From: Mark-Walter@t-online.de
Subject: RFC 1035 Bind
Date: Tue, 9 Nov 2004 20:02:02 +0100
Message-ID: <20041109190202.GB18755@marschmellow.homeunix.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

there's quite a lot to read about open UPD and TCP port for DNS
queries.

I read an article from a tech guru from microsoft as follow:-)

http://certcities.com/editorial/columns/story.asp?EditorialsID=144&page=2

As I understand RFC 1035 answering packet's over TCP are truncated
at a limit of 512 bytes but it could be more ...

Isn't it the comparing this document the best way while using 
UDP to DROP TCP packets over port 53 and to allow only UDP port 
53 at it does not use the IP protocol ?

Ok, I know there could be a problem in the inside of a webserverfarm
and you need to allow both protocols and he is refering to this
but generally I would like prefer to avoid TCP over port 53 concerning
to avoid a man-in-the-middle attack.

-- 
Best Regards, Mark. 
"Hello, I am brand new to meditation, and I have a frustrating habit of falling asleep in class. I don't know how to stop this. When my teacher tells us to relax our bodies and focus on breathing, my body relaxes, but so does my brain."

