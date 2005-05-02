From: "Deepak Seshadri" <d_s123@hotmail.com>
Subject: Re: rules for skype
Date: Mon, 2 May 2005 13:42:27 -0400
Message-ID: <BAY107-DAV9D47163CC3C594D794B10B7270@phx.gbl>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com><42764919.60507@lopsch.com>	<42764E36.7080300@riverviewtech.net><BAY107-DAV7808D3CABD608123BCF2CB7270@phx.gbl>
	<42765EE7.7040205@riverviewtech.net>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

>> - Block the authentication servers' IPs. The last I knew there were only 
>> 2 servers for authentication. Their IPs are given in that pdf document. I 
>> am not aware if they have added new servers now.
>
> *nod*  I had thought of this one as well.  Though I don't know how long 
> lived this will be before Skype gets around this too.
>
>> - Use Layer-7 pattern. Again, the layer-7 pattern has worked for some and 
>> not worked for many. It has worked for me.
>> My network scenario: The network I manage has private addresses 
>> throughout. I think it has something to do with NAT and private 
>> addressing because in my case when the client tries to authenticate with 
>> the server the hex-pattern of those UDP packets stays the same throughout 
>> every session. This has not been true in every case. You can give it a 
>> shot.
>
> Is there any way that you could share with us the layer 7 filters that you 
> use?

For the layer-7 patterns to work with iptables, you have to patch iptables. 
Here is the layer7 project URL:
http://l7-filter.sf.net

Note: They have a skype pattern matching only the voice traffic. For some 
reason they don't have the one that matches the authentication packets.

Here is the one I use:
------- begin-----
skype
^\x16\x03\x01$|^\x17\x03\x01$
-------end-------

Copy-paste the section between begin & end to a file named skype.pat.
Follow the instructions provided on the layer-7 filter webpage on how to use 
the pattern in your rule-set.

>
>> - Use *tc* to choke the skype traffic. I have a list of apps to allow 
>> through the network. The rest go into a default pipe of 2 Kbps. This 
>> deteriorates the performance of the application. I think text chatting 
>> will still go through but voice chatting, file sharing and all gets 
>> choked.
>> NOTE: I have had better success not blocking its default ports. That way 
>> I can keep it away from the standard Internet ports and thus easily 
>> classify it into the default pipe.
>
> Interesting.  I would not have thought of allowing just enough of the 
> traffic so that you could identify it and sort of attempt to control it. 
> However this would not be acceptable to some of my clients.  I'll keep 
> that in mind as a technique to deal with vicious protocols in the future. 
> Thanks.  :)
>
>> Now given the nature of this application, some things might work for you 
>> and some might not. I thought I would share my knowledge on this ....
>
> *nod*  This is unfortunately the very nature of these troublesome 
> protocols.  I'd also appreciate seeing your config if you could show it to 
> us.

Sorry. Could you please tell me what config you are talking about?

>
>
> Grant. . . .

Deepak 

