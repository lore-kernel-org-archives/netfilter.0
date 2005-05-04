From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Installing iptables 1.31
Date: Wed, 04 May 2005 11:01:59 -0500
Message-ID: <4278F1F7.6070709@riverviewtech.net>
References: <000b01c5502d$ff4c0650$2101a8c0@compaq>
	<4278CE0E.6060200@danbbs.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4278CE0E.6060200@danbbs.dk>
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

> Download the sources, configure and make. If no problems so far, rpm -e 
> the distro iptables, and make install your own stuff.

You will probably need to edit a make.conf file to make sure that the new version of IPTables gets installed to the correct location.  I know when I have done a configure / make / make install in the past with IPTables from source it puts things in /usr/local/x (which in and of it's self is not a problem) however distributions tend to put things in /usr/x not the local structure.  I would be tempted to remove the IPTables package via RPM and see if you could get a newer one to install that way too.  If you can't configuring and making from source should be fine.  Just look out for where the made files will be installed to by default.



Grant. . . .

