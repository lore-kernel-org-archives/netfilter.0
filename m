From: Brad Lhotsky <lhotskyb@grc.nia.nih.gov>
Subject: Re: same ip to multiple hostnames block
Date: Mon, 17 Apr 2006 11:41:44 -0400
Message-ID: <4443B738.8030102@grc.nia.nih.gov>
References: <52837e3e0604170613v2a6903fey50f0e983e5a04924@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <52837e3e0604170613v2a6903fey50f0e983e5a04924@mail.gmail.com>
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
To: Bruno Nunes <nunesb@gmail.com>
Cc: netfilter@lists.netfilter.org

That sounds like you're doing something similar to Apache's Name Based 
Virtual Hosting on the IIS Server.  I've never run IIS, so I have no 
idea.  But this is not a Network level issue, it's a web server issue.

Apache would have something like this:

<VirtualHost 1.2.3.4>
    ServerName zeus.xxxxxxxxxx.com
    DocumentRoot /www/zeus/html
    <Directory /www/zeus/html>
     Order deny,allow
     Allow from all
    </Directory>
</VirtualHost>


<VirtualHost 1.2.3.4>
    ServerName intranet.xxxxxxxxx.com
    DocumentRoot /www/intranet/html

    <Directory /www/intranet/html>
     Order deny,allow
     Deny from all
     Allow from 1.2.3.0/24 # OUR LOCAL SUBNET
    </Directory>
</VirtualHost>

So not a Layer 3 or 4 decision here.  This is a Layer 7 issue.

Bruno Nunes wrote:
> Hi,
> 
> I have:
> 
> intranet.xxxxxxxxxxx.com  -> ip A
> zeus.xxxxxxxxxxx.com.  -> ip A
> 
> both are redirections made with iptables to make ip A (local) accessed
> by world wide. When someone tries to access zeus or intranet by the
> hostname the host machine running IIS knows which website the user is
> trying to access.
> 
> my problem is:
> 
> how to block intranet.xxxxxxxx.com to be accessed by worldwide if it
> has the same ip as zeus.xxxxxxx.com? can i block by hostnames instead
> of an ip address??
> 
> thanks

-- 
Brad Lhotsky <lhotskyb@grc.nia.nih.gov>
NCTS Computer Specialist
Phone: 410.558.8006

