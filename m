From: =?UTF-8?B?SsO2cmcgRXNzZXI=?= <jackfritt@boh.de>
Subject: Re: opening a port..
Date: Thu, 09 Jan 2003 09:04:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1D2D11.50302@boh.de>
References: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local> 	<1042080082.606.21.camel@nirvana>  <1042088119.810.3.camel@india> 	<1042092980.487.4.camel@nirvana>  <1042093627.810.17.camel@india> 	<1042094721.423.15.camel@nirvana>  <1042095224.810.19.camel@india> <1042095879.433.17.camel@nirvana>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042095879.433.17.camel@nirvana>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>



mdew wrote:

>On Thu, 2003-01-09 at 19:53, Dharmendra.T wrote:
>  
>
>>>># nc -l -p 4662
>>>>
>>>>And then run nmap. You should get listed this port!
>>>>
>>>>-- 
>>>>Dharmendra.T
>>>>Linux Enthu
>>>>        
>>>>
>>>mdew:~# nc -l -p 4662
>>>ãP<H¹ogÝT'b´\Y6▒http://emule-project.net<6Ñ~ÖEmdew:~#
>>>
>>>(some strange characters, then it quits)
>>>
>>>mdew:~# netstat -an|grep 4662
>>>mdew:~#
>>>
>>>nirvana:/home/mdew# nmap 10.0.0.6
>>>      
>>>
nmap -p4662 10.0.0.6
Should work better.
and a new version of nmap should work better, too.
I heard that when you use nmap as your way it picks just well known 
ports (/etc/service file ?) and then you won´t get this special port if 
its not in there.(Maybe I´m wrong)

>>>Starting nmap V. 3.10ALPHA4 ( www.insecure.org/nmap/ )
>>>Interesting ports on debian (10.0.0.6):
>>>(The 1591 ports scanned but not shown below are in state: closed)
>>>Port       State       Service
>>>22/tcp     open        ssh
>>>25/tcp     open        smtp
>>>110/tcp    open        pop-3
>>>111/tcp    filtered    sunrpc
>>>113/tcp    open        auth
>>>135/tcp    filtered    loc-srv
>>>136/tcp    filtered    profile
>>>137/tcp    filtered    netbios-ns
>>>138/tcp    filtered    netbios-dgm
>>>139/tcp    filtered    netbios-ssn
>>>199/tcp    filtered    smux
>>>826/tcp    filtered    unknown
>>>953/tcp    filtered    rndc
>>>8080/tcp   open        http-proxy
>>>
>>>
>>>
>>>
>>>      
>>>
>>nc, I mean to say netcat.?
>>    
>>
>
>it was netcat
>
>apt-get install netcat
>
>
>
>
>  
>


