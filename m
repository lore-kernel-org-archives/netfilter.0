From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: rtsp-conntrack help needed...
Date: Sat, 17 Jan 2004 12:08:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401171208.57545.Antony@Soft-Solutions.co.uk>
References: <20570477.1074334865111.JavaMail.www@wwinf0601>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20570477.1074334865111.JavaMail.www@wwinf0601>
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
To: netfilter@lists.netfilter.org

On Saturday 17 January 2004 10:21 am, meillnco wrote:

> Hello all,
>
> This is my first post on this list but I've known netfilter for a while
> now... I'm just about to start using it though.
>
> Here is my question / problem : I have a generic configuration LAN <=>
> FIREWALL <=> INTERNET. My goal is to be able to play a video streamed by a
> public server. However, for the moment, my local clients can't stream as
> all RTP packets are stopped by the firewall.

Why are they being stopped?   What is your ruleset?

> Here comes (maybe ?) rtsp-conntrack...

Maybe, but let's not assume that's the solution until we've clearly identified 
the problem.

> I was wondering if anyone had already (and successfully) installed this
> patch ? I've been facing this problem for soooo long, any help would be
> much appreciated.

Have you attempted installing this patch and had a problem?   Or are you just 
asking "how do I install a patch"?

> Especially regarding installation / compliation tips and
> examples of the rules to add in my firewall configuration file.

Tell us what rules you have now and we may be able to suggest what to change.   
We can't tell you what rules you should be using because we don;t know the 
rest of your protocol requirements or your network configuration.

> PS : sorry if this message is inaccurate, I'm not so deep into Linux...

No problem - it's not Linux we need details of - it's your network and your 
firewall rules.

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


