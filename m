From: Rahul Jadhav <rahul@iatp.org>
Subject: Re: Can somebody help me with setting up a server behind a sdsl router?
Date: Mon, 16 Dec 2002 13:51:42 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFE2ECE.2080901@iatp.org>
References: <010801c2a527$782dcbd0$5d01a8c0@jason>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Corekin <jason@corekin.no-ip.com>
Cc: netfilter@lists.netfilter.org

Jason!
Did you guys try
1. enabling 'nat translations' on the router.
2. setting up 'nat server list' and if one already exists, (which is 
generally the case) add your mail server's ip to the list.
I believe your problem can be solved by doing just that.
good luck!
Rahul

Jason Corekin wrote:

> I have a friend who is trying to setup a Netopia R7100 sdsl router.  I 
> know that this is not a netfilter specific question, but it is largely 
> the same stuff, just a different implementation. He has a few 
> different publicly registered static ip's and has had one of the 
> assigned to the dsl connection and has had it configured to pass the 
> connection then to another router that is NATing for his internal 
> network.  Now he wants to use another one of his publicly registered 
> static ip's for his mail server, which we are trying to plug into one 
> of the unused jacks on the built it hub on the R7100.  The problem is 
> that we can not get the R7100 to respond to more then one public 
> address.  Is there a way that we should be able to setup the R7100 
> such that it would route the second address through it to the mail 
> server?  How would the rest of the internet know to talk to the R7100 
> to get to his mail server?  This sounds like just a basic routing 
> issue but my knowledge is limited.
>  
> Thanks for any help you might offer
>  
> Jason Corekin



-- 
         __  __     __   __	
        /_/ /_ \  _/ /  /  \	Institute for Agriculture
       __  __/ / \  _/ / / /	and Trade Policy
      / / /   /  / /  / __/	2105 First Ave S
     / / / / /  / /_ / /	Minneapolis MN 55404
     \/  \__/   \__/ \/		http://www.iatp.org

       I N F O R M A T I O N   T E C H N O L O G Y

The best things in life are done by people with nowhere to turn.
                                -The Blind Assassin (Margaret Atwood)




