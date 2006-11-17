From: tom <tom@t0mb.net>
Subject: inotify in netfilter socket
Date: Fri, 17 Nov 2006 23:30:39 +0000
Message-ID: <455E461F.7030605@t0mb.net>
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

Hi Guys,

I'm wondering if it's possible to set up an inotify watch on a netfilter socket.  I want to monitor for incoming packets to the netfilter QUEUE target, but I can't seem to do it. select.select works on it, but i wanted to use inotify really.  Is there any way to create a tangible file which i can hook in to the netfilter socket?  I was using python-inotify and the ipqueue module.  Any suggestions welcome.

Tom.


