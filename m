From: <yuksel@aydin.no-ip.org>
Subject: [Fwd: Re: block an ip]
Date: Sat, 14 Sep 2002 09:02:38 -0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <34576.10.0.0.10.1031994158.squirrel@aydin.no-ip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Ok, thanks a lot.

Here is a little part of my logs. 4 days like that ...

This night he tried with 3 differents ip to attack my port 23... I don't
have a telnet server ...

Friendly,
Yuksel.



Sep 13 00:41:18 aydin snort[16834]: [1:1256:6] WEB-IIS CodeRed v2
root.exe access [Classification: Web Application Attack] [Priority: 1]:
{TCP} 80.11.223.195:3184 -> 80.11.151.149:80
Sep 13 00:41:23 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3294 -> 80.11.151.149:80
Sep 13 00:41:25 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3367 -> 80.11.151.149:80
Sep 13 00:41:30 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3411 -> 80.11.151.149:80
Sep 13 00:41:43 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3539 -> 80.11.151.149:80
Sep 13 00:41:46 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3823 -> 80.11.151.149:80
Sep 13 00:41:57 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3876 -> 80.11.151.149:80
Sep 13 00:41:59 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:4149 -> 80.11.151.149:80
Sep 13 00:42:24 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:4191 -> 80.11.151.149:80
Sep 13 00:42:49 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:4758 -> 80.11.151.149:80
Sep 13 00:42:54 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:1498 -> 80.11.151.149:80
Sep 13 00:43:06 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:1626 -> 80.11.151.149:80
Sep 13 00:43:57 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:1899 -> 80.11.151.149:80
Sep 13 00:43:59 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3146 -> 80.11.151.149:80
Sep 13 00:44:05 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3187 -> 80.11.151.149:80
Sep 13 01:23:06 aydin snort[16834]: [1:1256:6] WEB-IIS CodeRed v2
root.exe access [Classification: Web Application Attack] [Priority: 1]:
{TCP} 80.11.223.195:2793 -> 80.11.151.149:80
Sep 13 01:23:14 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:2901 -> 80.11.151.149:80
Sep 13 01:23:19 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3040 -> 80.11.151.149:80
Sep 13 01:23:21 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3154 -> 80.11.151.149:80
Sep 13 01:23:23 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3205 -> 80.11.151.149:80
Sep 13 01:23:25 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3251 -> 80.11.151.149:80
Sep 13 01:23:27 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3311 -> 80.11.151.149:80
Sep 13 01:23:39 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3359 -> 80.11.151.149:80
Sep 13 01:23:45 aydin snort[16834]: [1:1002:5] WEB-IIS cmd.exe access
[Classification: Web Application Attack] [Priority: 1]: {TCP}
80.11.223.195:3648 -> 80.11.151.149:80
Sep 13 01:36:23 aydin snort[16834]: [1:1243:6] WEB-IIS ISAPI .ida
attempt [Classification: Web Application Attack] [Priority: 1]: {TCP}
172.161.241.216:2914 -> 80.11.151.149:80
Sep 13 01:54:34 aydin snort[16834]: [1:654:5] SMTP RCPT TO overflow
[Classification: Attempted Administrator Privilege Gain] [Priority: 1]:
{TCP} 62.4.17.82:1408 -> 80.11.151.149:25
Sep 13 01:58:07 aydin snort[16834]:







>     I think this is correct for IPtables.
>
> iptables -A input -s <offender-IP> -j MIRROR
>     OR
> iptables -A input -s <offender-IP> -j REJECT
>     OR
> iptables -A input -s <offender-IP> -j DROP
>
>     I think others would be abe to give you the posatoives and
> negatives
> of
> the above rules, and maybe better ones
>
> yuksel@aydin.no-ip.org wrote:
>
>> Hello,
>>
>> I'm a novice. I understand how to block acces to some ports but I
>> didn't understand how to block an ip.
>>
>> In fact, since 4 days, someone is trying ton hack my network and I
>> have his ip (he is using more than 10 ip...).
>>
>> I dont really care cause he is using some funny ways (he thinks that
>> I am under IIS :) ), but I prefer to stop him now.
>>
>> Friendly,
>> Yuksel.




