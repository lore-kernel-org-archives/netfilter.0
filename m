From: "John E. Leon Guerrero" <jguerrero@live365.com>
Subject: Re: Logging packet owner
Date: Mon, 15 Dec 2003 11:34:37 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FDE0CCD.80708@live365.com>
References: <3FD8E2D6.3040803@live365.com> <1071180480.10512.8.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071180480.10512.8.camel@porky>
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
To: Eric Leblond <eric@regit.org>
Cc: netfilter@lists.netfilter.org

hi eric, thanks for pointing out that project.  it's a little much for 
my immediate needs, but i do see it's usefulness in a larger context :)

for those would be interested in what i did in the meantime, here's my 
workaround for finding the process that was issuing rogue dns queries:
1. log and allow outgoing DNS packet
2. deny incoming DNS packets
  -hopefully the process waits around long enough for a response
3. issue lsof -n -i UDP:53 as soon as the outgoing log message hits
  -the -n is important or it can hang waiting for DNS as well :)
4. ps fax is a good idea if it's not obvious what the parent process is

good luck out there,
jlg

Eric Leblond wrote:

>Le jeu 11/12/2003 à 22:34, John E. Leon Guerrero a écrit :
>  
>
>>Hi folks, I browsed the last 7 months of archives and didn't see this 
>>question addressed.
>>
>>Are there plans to allow logging the packet owner?  For example, I get 
>>rogue DNS requests eminating from my workstation and I'd like to know 
>>which process is doing this.
>>    
>>
>
>you can do full user filtering and activity logging with the nufw
>project which is based on netfilter :
>	http://www.nufw.org/
>Complete logging of dropped packets will be available on the next
>release (0.6.1), which is planned to be available on monday (code is in
>cleaning and testing phase).
>
>BR,
>  
>


