From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: again problem with alias / virtual interface
Date: Thu, 22 Jul 2004 11:58:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FFF22D.8070803@pbl.ca>
References: <007d01c46dae$0a45f330$eb53623e@x> <Pine.LNX.4.44.0407211707490.31223-100000@Megathlon.ESI> <20040721114840.G9160@net.tamu.edu> <40FEA42C.3050006@pbl.ca> <20040721212717.R9160@net.tamu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040721212717.R9160@net.tamu.edu>
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
To: netfilter@lists.netfilter.org

Michael Sconzo wrote:
>>IMHO, the proper way of doing it is using configuration files.  And let 
>>the init.d scripts configure your interfaces (majority of which still 
>>use good old ifconfig).
> 
> 
> Have an example of such a config file, and what Linux distro you're using?

Files in /etc/sysconfig/network-scripts (well, at least on Red Hatish 
systems).  Unless you have something really special that can't be done 
using standard configuration files, of course (I'm not implying that 
everything can be fitted into standard config files).  Never done 
bridges, but by looking into ifup script, there's support for it. 
Search for if [ "${TYPE}" = "Bridge" ] line.

Anyhow, the point I was trying to make wasn't about should one use 
ifconfig or ip exclusivly.  The point was that one shouldn't worry about 
whether ifconfig or ip was used to configure interfaces, if his 
configuration can be described by use of standard set of config files. 
And even if it can't be described by use of standard set of config 
files, one shouldn't choose one over another because one is being 
labeled as "obsolite" and the other is "shiny new toy".

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

